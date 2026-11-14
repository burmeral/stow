#version 300 es
precision highp float;
in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
    vec4 c = texture(tex, v_texcoord);
    float l = dot(c.rgb, vec3(0.2126, 0.7152, 0.0722));

    // keep a fraction of the original color (0.0 = grayscale, 1.0 = full color)
    vec3 chroma = (c.rgb - l) * 0.45;

    // invert brightness only, then add the color back on top
    vec3 col = clamp(vec3(1.0 - l) + chroma, 0.0, 1.0);

    // gentle contrast around mid-gray
    col = clamp((col - 0.5) * 1.15 + 0.5, 0.0, 1.0);

    // posterize to 16 levels per channel
    col = floor(col * 15.0 + 0.5) / 15.0;

    // map black/white to ink/paper
    vec3 paper = vec3(0.93, 0.91, 0.86);
    vec3 ink   = vec3(0.10, 0.10, 0.11);
    fragColor = vec4(mix(ink, paper, col), c.a);
}
