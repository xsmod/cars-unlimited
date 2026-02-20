/** @type {import('next').NextConfig} */
import withDoctocat from '@primer/doctocat-nextjs/doctocat.config.js'

export default {
  ...withDoctocat({
    transpilePackages: ['@primer/doctocat-nextjs'],
    reactStrictMode: true,
    // distDir: "build",
    // output: "standalone",
    output: 'export',
    basePath: process.env.GITHUB_ACTIONS === 'true' && process.env.IS_PROD ? '/doctocat-nextjs' : '',
  })
}
