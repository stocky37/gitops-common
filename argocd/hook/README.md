# ArgoCD Hook

Implements standard hooks for ArgoCD applications.

> **Note:** If ArgoCD implements native webhooks, this may no longer be required.

The following options need to be overridden in the `hook-config` ConfigMap in order to configure the job for specific applications.

| Environment Variable | Description                                                                   |
|----------------------|-------------------------------------------------------------------------------|
| `APP_NAME`           | The name of the application that was just synced via ArgoCD.                  |
| `ENVIRONMENT`        | The lifecycle environment of the application that was just synced via ArgoCD. |
| `WEBHOOK_URL`        | The URL to POST the webhook to.                                               |


## Webhook Payload

A POST request will be sent to `WEBHOOK_URL` with the following format.

### HTTP Headers

| HTTP Header     | Description                                              |
|-----------------|----------------------------------------------------------|
| `X-ArgoCD-Hook` | The type of argocd hook that occurred (e.g. `PostSync`). |

### Payload

Assuming the following:

```json
{
	"name": "$APP_NAME",
	"environment": "$ENVIRONMENT"
}
```
