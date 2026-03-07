# Server Cleanup Tasks

## Orphan Files to Delete

The following files exist on the production server but not in the repository. They should be deleted after deployment:

### HTML Files
- `exposure.html` - Duplicate of index.html content, not linked from anywhere

### Verification Commands

After deployment, verify these files return 404:
```bash
curl -I https://thesignalsinstitute.com/exposure.html
```

## Valid Production Files

These HTML files should exist on the server:
- `index.html`
- `about.html`
- `programs.html`
- `integration.html`
- `riviera27.html`
- `contact.html`

## Deployment Notes

If using a sync-based deployment (rsync, S3 sync, etc.), use the `--delete` flag to remove orphan files:
```bash
rsync -avz --delete ./frontend/ user@server:/path/to/webroot/
```

If using Cloudflare Pages or similar, orphan files should be automatically removed on deploy.
