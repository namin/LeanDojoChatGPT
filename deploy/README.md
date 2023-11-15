# Steps to deploy in production

[![DigitalOcean](https://opensource.nyc3.cdn.digitaloceanspaces.com/attribution/assets/SVG/DO_Logo_horizontal_blue.svg)](https://www.digitalocean.com/?refcode=10856c6c1ff2)

These steps have been tested on a [DigitalOcean](https://www.digitalocean.com/?refcode=10856c6c1ff2) (referral link) docker application droplet.

- Clone the repository in your home directory. Assumes `$USER` is `namin` from now on.
- `cd LeanDojoChatGPT`
- `python3 -m venv leanenv`
- `source leanenv/bin/activate`
- `pip install loguru quart quart_cors lean-dojo`
- `cd leanenv/bin; ln -s /usr/bin/git git; cd ../..`
- `sudo cp deploy/leandojochatgpt.service /etc/systemd/system/`
- `sudo systemctl start leandojochatgpt`
- `sudo systemctl enable leandojochatgpt`
- `sudo systemctl status leandojochatgpt` (to check all OK)
- `sudo cp deploy/leandojochatgpt.livecode.ch /etc/nginx/sites-available/`
- `sudo ln -s /etc/nginx/sites-available/leandojochatgpt.livecode.ch /etc/nginx/sites-enabled`
- `sudo nginx -t`
- `sudo systemctl restart nginx`
- `sudo certbot --nginx -d leandojochatgpt.livecode.ch` (for SSL)
