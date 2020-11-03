#Stage 1 : set up 
#  Sử dụng node
FROM node as node

WORKDIR /app

COPY package.json ./

# chay npm 
RUN npm install

COPY . .

# chạy npm và build project có đường dẫn là: dist/nameproject
RUN npm run build --prod

# Stage 2
# RUn ....

FROM nginx

COPY --from=node /app/dist/inventoryapp /usr/share/nginx/html
