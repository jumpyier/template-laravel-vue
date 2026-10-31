import { defineConfig } from 'histoire'
import { HstVue } from '@histoire/plugin-vue'

export default defineConfig({
  plugins: [HstVue()],
  viteIgnorePlugins: ['laravel'],
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
