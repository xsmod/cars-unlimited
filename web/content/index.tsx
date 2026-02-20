'use client'
import { Grid, Box, Card, Hero } from '@primer/react-brand'
import { HeartIcon, NorthStarIcon, FileMediaIcon } from '@primer/octicons-react'
import Link from 'next/link'

export default function Index() {
  return (
    <>
      <div>
        <Hero align="center">
          <Hero.Eyebrow>
            <img
              src="https://github.com/primer/doctocat-nextjs/assets/13340707/536d426a-c72d-4316-a9e9-135a2182667c"
              alt=""
              width="500"
              loading="lazy"
              decoding="async"
            />
          </Hero.Eyebrow>
          <Hero.Heading style={{ marginTop: '-80px' }}>Cars Unlimited</Hero.Heading>
          <Hero.Description>documentation site</Hero.Description>
          <Box marginBlockStart={24}>
            <Link legacyBehavior href="/getting-started/scenario">
              <Hero.PrimaryAction href="/getting-started/scenario">Get started</Hero.PrimaryAction>
            </Link>
          </Box>
        </Hero>
      </div>
      <section
        style={{
          ['--brand-Card-maxWidth' as string]: '100%',
          maxWidth: '800px',
          margin: '0 auto',
          ['--brand-Grid-spacing-row' as string]: 'var(--brand-Grid-spacing-column-gap)',
        }}
      >
      </section>
    </>
  )
}
