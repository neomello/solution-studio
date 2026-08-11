declare const process: { env: Record<string, string | undefined> };

interface Env {
  META_API_TOKEN?: string;
  PUBLIC_META_PIXEL_ID?: string;
}

interface PagesFunctionContext<Env = Record<string, unknown>> {
  request: Request;
  env: Env;
  params?: Record<string, string>;
  waitUntil?: (promise: Promise<unknown>) => void;
}

interface MetaCapiRequestBody {
  event_name?: string;
  event_id?: string;
  event_source_url?: string;
  user_data?: {
    fbp?: string;
    fbc?: string;
    email?: string;
    phone?: string;
  };
  custom_data?: Record<string, unknown>;
}

export const onRequestPost = async (context: PagesFunctionContext<Env>) => {
  try {
    const { request, env } = context;

    const token = env.META_API_TOKEN || process.env.META_API_TOKEN;
    const pixelId =
      env.PUBLIC_META_PIXEL_ID ||
      process.env.PUBLIC_META_PIXEL_ID ||
      '2786954951664102';

    if (!token) {
      return new Response(
        JSON.stringify({
          success: false,
          error: 'META_API_TOKEN is not configured',
        }),
        { status: 400, headers: { 'Content-Type': 'application/json' } }
      );
    }

    const clientIp =
      request.headers.get('cf-connecting-ip') ||
      request.headers.get('x-forwarded-for') ||
      '';

    const userAgent = request.headers.get('user-agent') || '';

    let body: MetaCapiRequestBody = {};
    try {
      body = await request.json();
    } catch {
      body = {};
    }

    const eventName = body.event_name || 'PageView';
    const eventId =
      body.event_id ||
      `evt_${Date.now()}_${Math.random().toString(36).substring(2, 9)}`;
    const eventSourceUrl =
      body.event_source_url ||
      request.headers.get('referer') ||
      'https://studioodonto.xyz/';

    const payload = {
      data: [
        {
          event_name: eventName,
          event_time: Math.floor(Date.now() / 1000),
          event_id: eventId,
          event_source_url: eventSourceUrl,
          action_source: 'website',
          user_data: {
            client_ip_address: clientIp,
            client_user_agent: userAgent,
            fbp: body.user_data?.fbp || undefined,
            fbc: body.user_data?.fbc || undefined,
          },
          custom_data: body.custom_data || {},
        },
      ],
    };

    const graphUrl = `https://graph.facebook.net/v20.0/${pixelId}/events?access_token=${token}`;

    const metaResponse = await fetch(graphUrl, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(payload),
    });

    const metaResult = await metaResponse.json();

    return new Response(
      JSON.stringify({
        success: metaResponse.ok,
        event_id: eventId,
        meta_result: metaResult,
      }),
      {
        status: metaResponse.status,
        headers: { 'Content-Type': 'application/json' },
      }
    );
  } catch (error: any) {
    return new Response(
      JSON.stringify({
        success: false,
        error: error?.message || 'Internal Server Error',
      }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
};
