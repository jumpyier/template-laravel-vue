import { defineConfig } from 'histoire'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  storyMatch: ['resources/js/**/*.story.vue'],
  theme: {
    title: 'Jumpyier Design System',
  },
  vite: {
    resolve: {
      alias: {
        '@': '/resources/js',
      },
    },
  },
})
