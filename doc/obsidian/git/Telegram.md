# Telegram-нотификация для [[GitHub]]
https://t.me/metaLprogram

- https://github.com/marketplace/actions/telegram-notify
- https://www.youtube.com/watch?v=kGbScE_PFvE

#### [[GitHub]]

- меню пользователя -> Settings
- левое меню -> Developer settings https://github.com/settings/apps
- Personal access tokens -> Tokens (classic)
	- Generate new token (classic)
		- Note: `telegram_notify`
		- Expiration: `90 days` (more secure, limit spam on down projects)
		- Select scopes
			- `notifications`
		- Generate token

token: `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`

#### [[Telegram]]

- `@GitHubBot`
	- `/connect`  -> Authorize `zhukov`
	- `/newintegration`
	- choose repo: `ponyatov/skelex`
	- choose mode: `Group`
	- select https://t.me/metaLprogram
