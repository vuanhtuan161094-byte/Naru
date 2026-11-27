# External animation reuse review

PixelEffects: normalize original rectangles and pivot using Unity metadata and frame IDs; preserve source order, shared scale and source anchor; output max 30 cels per 128x128 strip (sample evenly if larger). Runtime fallback only where authored skill sheets absent. Existing official art wins. Native capture workflow generates review-only assets; production web is not modified until visual acceptance.

Naruto-Bound source includes baked atlases with per-cel rectangle, pivot, duration, ordered animation lists. Local conversion only: `python3 art/external/convert_reuse.py ninja --source /path/to/local/repository --out /path/to/local/review`. Output 96x112 cel strips and GIF; direction and identity remain unverified; no fabricated directions or remapping generic ninja to named characters. Source permission must be established before public upload. No external scripts executed.

No combat logic changes. CI and visual approval pending.
