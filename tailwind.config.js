/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './resources/**/*.blade.php',
        './resources/**/*.js',
        './resources/**/*.vue',
    ],
    theme: {
        extend: {
      /* jumpyier:tokens:start */
      colors: {
        'accent': '#2563eb',
        'card': '#f9fafb',
        'ink': '#111827',
        'muted': '#6b7280',
        'surface': '#ffffff',
      },
      spacing: {
        'card': '1.5rem',
      },
      borderRadius: {
        'card': '0.5rem',
      },
      /* jumpyier:tokens:end */
        },
    },
    plugins: [],
}
