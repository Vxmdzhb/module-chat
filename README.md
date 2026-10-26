# astrx/module-chat

No-JavaScript chat: rooms, private messages, attachments, moderation — the **Chat** module of [AstrX](https://github.com/Vxmdzhb/astrx).

![The chat](docs/screenshot.png)

- Module key: `chat` (switch it on in the site's `resources/config/Modules.config.php`)
- Pages: `admin_chat_filters`, `admin_config_chat`, `chat_admin`, `chat`, `chat_file`, `chat_help`, `chat_login`, `chat_pm`, `chat_settings`, `chat_stream`, `chat_users`, `chat_wait`
- Requires: `astrx/cms`, `astrx/framework`, `astrx/library`

It ships its own templates, catalogs (en, it), default configuration and SQL in
`resources/`; the site overrides any of them from its own `resources/`.

AstrX isn't on Packagist and doesn't tag versions: you install from each
repository's `main`, and your `composer.lock` pins the exact commit. Tell
Composer where to find the package and the AstrX packages it depends on:

```json
{
    "minimum-stability": "dev",
    "prefer-stable": true,
    "repositories": [
        { "type": "vcs", "url": "https://github.com/Vxmdzhb/module-chat" },
        { "type": "vcs", "url": "https://github.com/Vxmdzhb/cms" },
        { "type": "vcs", "url": "https://github.com/Vxmdzhb/framework" },
        { "type": "vcs", "url": "https://github.com/Vxmdzhb/library" }
    ]
}
```

Then:

```sh
composer require astrx/module-chat:dev-main
```

After that, list `AstrX\Chat\ChatModule::class` in the
site's `ApplicationModules::INSTALLED` and run the installer to create its
tables. See [modules](https://github.com/Vxmdzhb/astrx/blob/main/docs/MODULES.md).

Issues and pull requests are welcome here. [AstrX](https://github.com/Vxmdzhb/astrx)
is the site that puts all the packages together.
