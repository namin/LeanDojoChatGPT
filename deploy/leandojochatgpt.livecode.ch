server {
    server_name leandojochatgpt.livecode.ch;
    listen 80;
    location / {
        include proxy_params;
        proxy_pass http://unix:/home/namin/LeanDojoChatGPT/leandojochatgpt.sock;
    }
}