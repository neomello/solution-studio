export function trackClick(label: string, href: string) {
  if (typeof window === 'undefined') return;
  try {
    window.dispatchEvent(
      new CustomEvent('tc:click', { detail: { label, href } })
    );
  } catch {}
}
