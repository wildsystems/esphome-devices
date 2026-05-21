# Contribution Guidelines

Thank you for your interest in contributing to WildSystems ESPHome devices!

## Adding a New Device

1. **Fork** this repository
2. **Create** a new YAML file named `your-device-name.yaml`
3. **Follow** the template structure (see `edge-led-base.yaml`)
4. **Test** your config with `esphome config your-device-name.yaml`
5. **Update** README.md with device information
6. **Submit** a pull request

## Device Config Requirements

All device configs must include:

### Required Components
```yaml
esphome:
  name: device-name
  friendly_name: "Device Name"
  name_add_mac_suffix: true
  project:
    name: wildsystems.device-name
    version: "1.0.0"

dashboard_import:
  package_import_url: github://wildsystems/esphome-devices/device-name.yaml@main
  import_full_config: false

logger:
api:
ota:
  - platform: esphome
wifi:
  ap:
captive_portal:
```

### Best Practices

- ✅ Use `substitutions:` for user-customizable values
- ✅ Set `restore_mode: ALWAYS_OFF` or make it configurable
- ✅ Include diagnostic entities (uptime, wifi_signal, version)
- ✅ Document button/control mappings in comments
- ✅ Test with `esphome config` before submitting
- ✅ Keep configs single-file (no external packages for public configs)
- ✅ Use descriptive entity names

### Documentation

Each device should include in README.md:
- Hardware specs (MCU, peripherals, GPIO mapping)
- Feature list
- Quick start guide
- Customization options
- Link to hardware design files (if open-source)

## Code Style

- Use 2-space indentation
- Follow ESPHome YAML conventions
- Comment complex logic blocks
- Use clear, descriptive entity names

## Testing

Before submitting:
```bash
esphome config your-device.yaml
```

CI will automatically validate all configs on PR.

## Questions?

Open an issue or reach out via ESPHome Discord.
