declare module '@primer/doctocat-nextjs/doctocat.config.js' {
  import type { NextConfig } from 'next'

  function withDoctocat(config: NextConfig): NextConfig

  export default withDoctocat
}
