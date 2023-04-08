function [x_min, f_min,  kmax] = scalar_methods(f, a, b, eps, kmax, method)
if method == "dychotomy"
    [x_min, f_min,  kmax] = dychotomy(f, a, b, eps, kmax);
end
if method == "golden section"
    [x_min, f_min,  kmax] = golden_section(f, a, b, eps, kmax);
end
if method == "brute force"
    [x_min, f_min,  kmax] = brute_force(f, a, b, eps, kmax);
end
end