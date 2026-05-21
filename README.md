# WildSystems ESPHome Devices

Public ESPHome configurations for WildSystems devices, designed for easy adoption via the ESPHome Dashboard.

## Supported Devices

### Edge LED Base

**ESP32-C6 based WS2813B LED controller with single-button control**

[![Open your Home Assistant instance and add this device.](https://my.home-assistant.io/badges/esphome_adopt.svg)](https://my.home-assistant.io/redirect/esphome_adopt/?url=https://github.com/wildsystems/esphome-devices/blob/main/edge-led-base.yaml)

#### Features
- ✅ **Standalone operation** - Works without Home Assistant via local web UI
- ✅ **Single-button control** - Full LED control with multi-gesture support
- ✅ **Easy provisioning** - Improv WiFi via BLE or captive portal
- ✅ **14 built-in effects** - Rainbow, pulse, twinkle, fireworks, and more
- ✅ **9 color presets** - Red, orange, yellow, green, cyan, blue, purple, magenta, white
- ✅ **Configurable** - Adjust LED count and timings via substitutions

#### Button Gestures
| Gesture | Action |
|---------|--------|
| Single press | Toggle ON/OFF |
| Double press | Cycle color preset |
| Triple press | Cycle effect |
| Long press (≥600ms) | Ramp brightness up/down |
| 5 presses in 10s | Factory reset |

#### Hardware
- **MCU:** ESP32-C6-WROOM-H8
- **LED Output:** GPIO18 (5V buffered via 74AHCT1G125)
- **Button:** GPIO9 (active-LOW, internal pull-up)
- **Power:** USB-C 5V
- **LED Support:** WS2813B / WS2812B addressable RGB strips

#### Quick Start

1. **Flash firmware** via USB-C (hold button while plugging in for download mode)
2. **Provision WiFi:**
   - Connect to `Edge-LED-Base-XXXXXX` AP (password: `edgeled-setup`)
   - Open captive portal or use [Improv WiFi](https://www.improv-wifi.com/)
3. **Control:**
   - Local web UI at `http://edge-led-base-XXXXXX.local/`
   - Or adopt in Home Assistant ESPHome dashboard

#### Customization

Edit substitutions in your local config after adoption:

```yaml
substitutions:
  num_leds: "60"              # Adjust for your strip length
  default_transition_ms: "500ms"  # Slower transitions
  long_press_threshold_ms: "800ms"  # Longer hold needed
```

#### Documentation
- [Hardware design files](https://github.com/wildsystems/edge-led-base)
- [Firmware source](https://github.com/wildsystems/edge-led-base/tree/main/lighting/led-base/firmware)
- [Production test plan](https://github.com/wildsystems/edge-led-base/blob/main/PRODUCTION_TEST_PLAN.md)

---

## Adding Your Own Device

Want to add a WildSystems device to this repository?

1. Fork this repo
2. Add your device's public config YAML
3. Update this README with device info
4. Submit a pull request

### Config Requirements

For ESPHome Dashboard import, your config must include:

```yaml
esphome:
  name: your-device
  friendly_name: "Your Device"
  name_add_mac_suffix: true
  project:
    name: wildsystems.your-device
    version: "1.0.0"

dashboard_import:
  package_import_url: github://wildsystems/esphome-devices/your-device.yaml@main
  import_full_config: false

# Required for dashboard adoption
logger:
api:
ota:
  - platform: esphome

wifi:
  ap:

captive_portal:
```

See [ESPHome Creator's Guide](https://esphome.io/guides/creators.html) for full details.

---

## License

MIT License - See individual device repositories for hardware license details.

## Support

For device-specific issues, see the individual device repositories linked above.

For ESPHome configuration help, visit:
- [ESPHome Discord](https://discord.gg/KhAMKrd)
- [Home Assistant Community Forums](https://community.home-assistant.io/c/esphome/)

---

**Made by WildSystems**

---

## Development Setup

For contributors adding new devices to this repository:

### Clone and Setup

```bash
# Clone the repo
git clone https://github.com/wildsystems/esphome-devices.git
cd esphome-devices

# Install ESPHome (for validation)
pip install esphome

# The pre-commit hook is already in the repo
# Test it works:
./validate-all.sh
```

### Adding a New Device

1. Create `your-device.yaml` (see `CONTRIBUTING.md`)
2. Test locally:
   ```bash
   esphome config your-device.yaml
   ```
3. Run full validation:
   ```bash
   ./validate-all.sh
   ```
4. Commit (pre-commit hook validates automatically):
   ```bash
   git add your-device.yaml
   git commit -m "feat: Add your-device config"
   ```
5. Push and create PR

### Pre-commit Validation

The pre-commit hook automatically validates all staged `*.yaml` configs before allowing commit.

To bypass (not recommended):
```bash
git commit --no-verify
```

To manually validate all configs:
```bash
./validate-all.sh
```
