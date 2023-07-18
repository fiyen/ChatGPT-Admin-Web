# 使用一个基于Node.js的镜像作为基础
FROM node:16.14-alpine

# 设置工作目录
WORKDIR /app

# 将 package.json 和 pnpm-lock.yaml 复制到工作目录
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml tsconfig.json turbo.json ./

# 安装pnpm
RUN npm install -g pnpm

# 安装项目依赖项
RUN pnpm install

# build
RUN pnpm build

# 将项目文件复制到工作目录
COPY . .

# 暴露应用程序所使用的端口（如果适用）
EXPOSE 3000

# 运行应用程序
CMD ["pnpm", "run", "dev"]
