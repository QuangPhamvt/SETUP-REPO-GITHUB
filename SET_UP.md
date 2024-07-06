# Các bước setup source

## Chung
### Cài đặt cái lib kiểm soát source
- Kiểm soát syntax và format code
  - Eslint: https://eslint.org/
  - Prettier: https://prettier.io/
- Chặn code bẩn, kiểm soát code trước khi đc phép tạo PR
  - Husky: https://typicode.github.io/husky/
  - Commitlint: https://github.com/conventional-changelog/commitlint
- Script cho Eslint và Prettier
  - Nestjs  
```json
    "format": "prettier --check \"src/**/*.ts\" ",
    "format:fix": "prettier --write \"src/**/*.ts\" ",
    "lint": "eslint \"{src,apps,libs}/**/*.ts\" --fix",
```
  - React/Nextjs
```json
    "fmt": "prettier --check \"./src/**/*.{js,jsx,ts,tsx,json,css,scss,md}\"",
    "fmt:fix": "prettier --write \"./src/**/*.{js,jsx,ts,tsx,json,css,scss,md}\"",
    "lint": "next lint",
    "lint:fix": "eslint src --fix && npm run fmt:fix",
```
- Note: Tuỳ thuộc vào yêu cầu của dự án, thì sẽ có các file setup eslint, prettier riêng, có thể cài thêm 1 số plugin của eslint để kiểm soát source đẹp hơn

### Front-End 
- Cài đặt prettier cho tailwind: https://github.com/tailwindlabs/prettier-plugin-tailwindcss
- Dùng Vite
- Một số thư viên react hay dùng: react-router, Zustand, Redux, Axios, Shadcn, Mui, tailwind, react-hook-form, lucide-react, storybook, dayjs

### Nextjs
- Sử dụng các lib như react nhưng ko dùng react-router
- Sử dụng 1 số config optimzie như
```json
    "dev": "next dev -H local.lunas.vn",
    "build": "next build --debug --profile --experimental-debug-memory-usage", // xuất thông tin build size
```

### Nestjs
- Config như docs nestjs cho chứ không khác biêt là bao 
