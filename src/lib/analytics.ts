export function generateEventId(): string {
  return `evt_${Date.now()}_${Math.random().toString(36).substring(2, 9)}`;
}

export function getCookie(name: string): string | undefined {
  if (typeof document === 'undefined') return undefined;
  const match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
  return match ? decodeURIComponent(match[2]) : undefined;
}

export function dispatchMetaDualEvent(
  eventName: string,
  customData: Record<string, unknown> = {},
  eventId?: string
) {
  if (typeof window === 'undefined') return;

  const finalEventId = eventId || generateEventId();

  try {
    if (typeof (window as any).fbq === 'function') {
      (window as any).fbq('track', eventName, customData, { eventID: finalEventId });
    }
  } catch {}

  try {
    const fbp = getCookie('_fbp');
    const fbc = getCookie('_fbc');
    const sourceUrl = window.location.href;

    fetch('/api/meta-capi', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      keepalive: true,
      body: JSON.stringify({
        event_name: eventName,
        event_id: finalEventId,
        event_source_url: sourceUrl,
        user_data: { fbp, fbc },
        custom_data: customData,
      }),
    }).catch(() => {});
  } catch {}
}

export function trackClick(label: string, href: string, eventName: string = 'Contact') {
  if (typeof window === 'undefined') return;

  const eventId = generateEventId();

  try {
    window.dispatchEvent(
      new CustomEvent('tc:click', { detail: { label, href, eventName, eventId } })
    );
  } catch {}

  dispatchMetaDualEvent(eventName, { content_name: label, href }, eventId);
}
