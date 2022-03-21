## Configuring Hadolint

In **[Megabyte Labs](https://megabyte.space)** projects, we store our Hadolint configuration in `.config/hadolint.yml`. To accomodate this custom configuration location, we included the ability to specify the location of the configuration in the `.codeclimate.yml` file. Here is an example of customizing the location of the Hadolint configuration:

### Sample CodeClimate Configuration

```yaml
---
engines:
  hadolint:
    enabled: true
    options:
      config: .config/hadolint.yml
```
