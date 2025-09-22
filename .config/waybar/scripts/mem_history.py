#!/usr/bin/env python3
"""Memory Usage Graph Monitor - Displays a unicode graph of memory usage history using Braille characters."""
import json
import os
import sys
import psutil
import argparse
from pathlib import Path

# Configuration
CACHE_DIR = Path(os.environ.get('XDG_CACHE_HOME', Path.home() / '.cache'))
HISTORY_FILE = CACHE_DIR / 'mem_usage_history.json'
DEFAULT_HISTORY_DEPTH = 40

# Braille patterns for vertical bar graphs
BRAILLE_PATTERNS = {
    (0, 0): '⠀', (1, 0): '⡀', (2, 0): '⡄', (3, 0): '⡆', (4, 0): '⡇',
    (0, 1): '⢀', (1, 1): '⣀', (2, 1): '⣄', (3, 1): '⣆', (4, 1): '⣇',
    (0, 2): '⢠', (1, 2): '⣠', (2, 2): '⣤', (3, 2): '⣦', (4, 2): '⣧',
    (0, 3): '⢰', (1, 3): '⣰', (2, 3): '⣴', (3, 3): '⣶', (4, 3): '⣷',
    (0, 4): '⢸', (1, 4): '⣸', (2, 4): '⣼', (3, 4): '⣾', (4, 4): '⣿',
}

def get_braille_char(left_val, right_val):
    """Convert two percentage values (0-100) to a single Braille character."""
    # Convert percentages to levels (1-4), minimum 1 to always show at least one dot
    left_level = max(1, min(int(left_val * 4 / 100), 4))
    right_level = max(1, min(int(right_val * 4 / 100), 4))
    return BRAILLE_PATTERNS.get((left_level, right_level), '⣀')

def load_data():
    """Load data from cache file."""
    try:
        with open(HISTORY_FILE, 'r') as f:
            data = json.load(f)
            # Handle legacy format
            if isinstance(data, list):
                return {"history": data, "show_graph": True}
            return data
    except (FileNotFoundError, json.JSONDecodeError):
        return {"history": [], "show_graph": True}

def save_data(data):
    """Save data to cache file."""
    CACHE_DIR.mkdir(parents=True, exist_ok=True)
    with open(HISTORY_FILE, 'w') as f:
        json.dump(data, f)

def humanize_bytes(num):
    """Convert bytes into human-readable string."""
    if num > 1 << 30:
        return f"{num / (1 << 30):.2f} GB"
    else:
        return f"{num / (1 << 20):.2f} MB"

def main():
    parser = argparse.ArgumentParser(description='Memory: Usage Graph Monitor with Braille display')
    parser.add_argument('command', nargs='?', help='Command: toggle')
    parser.add_argument('-d', '--depth', type=int, default=DEFAULT_HISTORY_DEPTH,
                        help=f'History depth (default: {DEFAULT_HISTORY_DEPTH})')
    args = parser.parse_args()
    
    # Ensure even depth for Braille pairs
    history_depth = args.depth + (args.depth % 2)
    
    data = load_data()
    
    # Handle toggle command
    if args.command == "toggle":
        data["show_graph"] = not data.get("show_graph", True)
        save_data(data)
        return
    
    # Get memory usage
    vmemory = psutil.virtual_memory()
    current_usage = vmemory.percent
    
    # Update history
    history = data["history"]
    history.append(current_usage)
    
    # Keep only needed history
    if len(history) > history_depth:
        history = history[-history_depth:]
    
    # Generate output
    if data.get("show_graph", True):
        # Pad with zeros if needed
        padded = [0.0] * (history_depth - len(history)) + history
        
        # Build graph
        graph = ''.join(
            get_braille_char(
                padded[i],
                padded[i + 1] if i + 1 < history_depth else 0.0
            )
            for i in range(0, history_depth, 2)
        )
        text = f"[{graph}]"
    else:
        text = f"{current_usage:.1f}%"
    
    # Save and output
    data["history"] = history
    save_data(data)

    # Build tooltip with memory details
    total = vmemory.total
    used_pct = (vmemory.used / total) * 100
    avail_pct = (vmemory.available / total) * 100
    free_pct = (vmemory.free / total) * 100

    # Stats already converted to human-readable
    mem_stats = {
        "Total": (humanize_bytes(vmemory.total), None),
        "Used": (humanize_bytes(vmemory.used), used_pct),
        "Available": (humanize_bytes(vmemory.available), avail_pct),
        "Cached": (humanize_bytes(getattr(vmemory, "cached", 0)), None),
        "Free": (humanize_bytes(vmemory.free), free_pct),
    }

    tooltip_lines = []
    for key, (text_val, pct) in mem_stats.items():
        # Assign colors
        if key == "Used":
            if pct >= 80:
                color = "#ff6b6b"  # red
            elif pct >= 60:
                color = "#feca57"  # yellow
            elif pct >= 40:
                color = "#48dbfb"  # cyan
            else:
                color = "#1dd1a1"  # green
        elif key in ("Available", "Free"):
            if pct is not None and pct <= 20:
                color = "#ff6b6b"  # red
            elif pct is not None and pct <= 40:
                color = "#feca57"  # yellow
            else:
                color = "#1dd1a1"  # green
        elif key == "Cached":
            color = "#48dbfb"  # cyan
        else:  # Total
            color = "#eeeeee"  # neutral gray

        tooltip_lines.append(f'<span color="{color}">{key}: {text_val}</span>')

    # Output for waybar
    print(json.dumps({
        "text": text,
        "tooltip": '\n'.join(tooltip_lines),
        "class": "cpu-history"
    }))

if __name__ == "__main__":
    main()
