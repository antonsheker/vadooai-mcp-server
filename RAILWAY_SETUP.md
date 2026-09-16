# Deploy Vadoo MCP on Railway

## 1. Deploy the repository

1. Open [Railway](https://railway.com/new).
2. Choose **Deploy from GitHub repo**.
3. Select `antonsheker/vadooai-mcp-server`.
4. Railway will detect the included Dockerfile.

## 2. Add the Vadoo secret

In the Railway service, open **Variables** and add:

```text
VADOO_API_KEY=your_actual_vadoo_api_key
```

Never commit the real API key to GitHub.

## 3. Create the public address

Open **Settings → Networking → Public Networking**, then select
**Generate Domain**.

The ChatGPT MCP address is:

```text
https://YOUR-RAILWAY-DOMAIN/mcp
```

The health check is available at:

```text
https://YOUR-RAILWAY-DOMAIN/status
```

## 4. Connect in ChatGPT

1. Open **Settings → Security and login**.
2. Enable **Developer mode**.
3. Open **Plugins**, select **+**, and create a developer-mode app.
4. Name it **Vadoo AI**.
5. Choose **No authentication**.
6. Enter the Railway URL ending in `/mcp`.
7. Create the connection and confirm the discovered tools.

## 5. Test safely

Call `get_balance` first. Then call `list_voices`. Only after those succeed
should you call `generate_video`.

## Security note

This simple deployment uses an unlisted public MCP endpoint. Anyone who obtains
the exact endpoint could invoke Vadoo tools and consume account credits. Use it
only as a personal developer-mode connection, do not publish the endpoint, set
Vadoo spending limits if available, and rotate the Vadoo key if the URL or key
is exposed. OAuth should be added before sharing the MCP server with other
people.
