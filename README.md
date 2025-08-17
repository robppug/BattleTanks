# BattleTanks Clone

Prototype Godot 4 project for mobile tank battles.

## Build
1. Install Godot 4.x.
2. Open project.godot.
3. Export using provided Android or iOS presets.

## Controls
- Left virtual stick: movement.
- Right drag: aim bias.
- Abilities mapped to four buttons.

## Smoke Test Checklist
1. Run Demo scene and verify a tank fires automatically.
2. Capture a control point and observe capture output in console.
3. Wait for force gold tick message.
4. Trigger a gacha pull via UI_Gacha script.

## Tests
Run `godot4 --headless --script src/TestRunner.gd` to execute unit tests.
