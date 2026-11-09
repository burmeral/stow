#version 300 es
precision highp float;
in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
    vec4 c = texture(tex, v_texcoord);
    float l = dot(c.rgb, vec3(0.2126, 0.7152, 0.0722));

    // keep a fraction of the original saturation (0.0 = grayscale, 1.0 = unchanged)
    vec3 col = mix(vec3(l), c.rgb, 0.45);

    // contrast curve
    col = clamp((col - 0.5) * 1.15 + 0.5, 0.0, 1.0);

    // 16 level posterization
    col = floor(col * 15.0 + 0.5) / 15.0;

    // map black/white to ink/paperi
    vec3 paper = vec3(0.93, 0.91, 0.86);
    vec3 ink   = vec3(0.12, 0.12, 0.13);
    fragColor = vec4(mix(ink, paper, col), c.a);
}
