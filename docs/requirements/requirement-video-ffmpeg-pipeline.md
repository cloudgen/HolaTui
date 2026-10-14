**file**: docs/requirements/requirement-video-ffmpeg-pipeline.md
**Status**: Retired (Version 1.0.0)
**Area**: video
**Key**: `requirement-video-ffmpeg-pipeline`
**Philosophy**: CIAO **v2.10.2** / CIAO-Lite (Caution • Intentional • Anti-fragile • Over-engineered / Over-protect)

## 1. Purpose

This file records that HolaTui does **not** concatenate media and does **not** call an encoder. The file stays so the registry can show the retirement. It is not Active law.

## 2. Core Rules (Mandatory)

1. **Retired.** No rule in this file requires FFmpeg, concat, a temp media file, or a publish step.
2. **Verbs.** `join` and `list-videos` are not product verbs. `requirement-domain-holatui` owns that ban.
3. **Do not revive** this file to Active without an explicit user order and a registry update in the same change.

## 3. Design Principles (CIAO / CIAO-Lite)

- **Caution:** A retired file is not a hidden encoder requirement.
- **Intentional:** The retirement is written down.
- **Anti-fragile:** The welcome line does not need an encoder.
- **Over-protect:** Do not delete the retirement record while the registry still names it.

## 4. Protection Rule (Sacred)

**Future AI assistants or maintainers MUST NOT:**

- Treat this Retired file as permission to add FFmpeg.
- Mark it Active without an explicit user order.
