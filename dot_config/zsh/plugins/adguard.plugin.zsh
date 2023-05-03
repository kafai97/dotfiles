#!/usr/bin/env zsh

_call_adguard() {
  curl -X POST \
    'http://adguard.192.168.0.111.sslip.io/control/blocked_services/set' \
    --header 'Content-Type: application/json' \
    --data-raw $1
}

unblockall() {
  curl -X POST \
    'http://adguard.192.168.0.111.sslip.io/control/blocked_services/set' \
    --header 'Content-Type: application/json' \
    --data-raw '[]'
}

blockall() {
  _call_adguard '[
  "icloud_private_relay",
  "9gag",
  "amazon",
  "bilibili",
  "dailymotion",
  "deezer",
  "discord",
  "disneyplus",
  "douban",
  "ebay",
  "epic_games",
  "facebook",
  "hulu",
  "imgur",
  "instagram",
  "mail_ru",
  "mastodon",
  "minecraft",
  "netflix",
  "ok",
  "origin",
  "pinterest",
  "qq",
  "reddit",
  "roblox",
  "skype",
  "snapchat",
  "spotify",
  "steam",
  "telegram",
  "tiktok",
  "tinder",
  "twitch",
  "twitter",
  "viber",
  "vimeo",
  "vk",
  "wechat",
  "weibo",
  "whatsapp",
  "youtube",
  "zhihu"
]'
}
