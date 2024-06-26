#!/bin/bash
NOW=$(date +"%m-%d-%Y %H:%M:%S PT")

/usr/bin/git pull

/usr/bin/python3 cloudflare_ips.py

if ! grep -q "error" "../cloudflare-ips-v4.rsc" && ! grep -q "error" "../cloudflare-ips-v6.rsc"; then
    /usr/bin/git add ../cloudflare-ips-v*
    /usr/bin/git status
    /usr/bin/git commit --author="Davie3 <Davie3@users.noreply.github.com> ModifiedByJoey" -m "Run automations and generate fresh lists - $NOW"
    /usr/bin/git push
fi
