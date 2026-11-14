#version 300 es
precision highp float;
in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
    vec2 size = vec2(textureSize(tex, 0));   // screen size in pixels
    vec2 cc   = v_texcoord - 0.5;

    // barrel distortion (curved glass)
    vec2 uv = 0.5 + cc * (1.0 + 0.05 * dot(cc, cc));
    if (uv.x < 0.0 || uv.x > 1.0 || uv.y < 0.0 || uv.y > 1.0) {
        fragColor = vec4(0.0, 0.0, 0.0, 1.0);   // black bezel in the corners
        return;
    }

    // slight RGB separation (chromatic aberration)
    float ca = 0.0008;
    vec3 col = vec3(
        texture(tex, uv + vec2(ca, 0.0)).r,
        texture(tex, uv).g,
        texture(tex, uv - vec2(ca, 0.0)).b
    );

    // scanlines: one dark band every 3 pixels
    float scan = 0.5 + 0.5 * sin(uv.y * size.y * 2.0944);
    col *= 1.0 - 0.25 * (1.0 - scan);

    // phosphor mask: dim two of every three pixel columns per channel
    float m = mod(floor(uv.x * size.x), 3.0);
    col *= vec3(m < 1.0 ? 1.0 : 0.85,
                (m >= 1.0 && m < 2.0) ? 1.0 : 0.85,
                m >= 2.0 ? 1.0 : 0.85);

    // vignette, then a little gain to make up for the darkening above
    col *= 1.0 - 0.4 * smoothstep(0.25, 0.75, length(cc));
    col *= 1.15;

    fragColor = vec4(col, 1.0);
}
