# 使用网易云镜像
FROM selenium/node-chrome:latest

# 设置工作目录
WORKDIR /app

# 首先复制依赖相关文件
COPY package*.json ./
COPY .env* ./

# 然后再复制其他源代码
COPY ./ .

# 安装依赖并构建
RUN npm install && \
    npm run build

# 暴露端口
EXPOSE 3000

# Puppeteer setup: Skip Chromium download and use the installed Chrome
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV CHROME_PATH=/usr/bin/google-chrome-unstable
# ENV NODE_ENV=production
# ENV NEXT_PUBLIC_BASE_URL=http://localhost:3000

# 启动命令
CMD ["npm", "start"] 