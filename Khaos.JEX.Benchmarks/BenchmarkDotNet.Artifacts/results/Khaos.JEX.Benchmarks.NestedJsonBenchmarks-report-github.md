```

BenchmarkDotNet v0.15.8, Windows 11 (10.0.26200.7628/25H2/2025Update/HudsonValley2)
13th Gen Intel Core i7-13650HX 2.60GHz, 1 CPU, 20 logical and 14 physical cores
.NET SDK 10.0.101
  [Host]     : .NET 10.0.1 (10.0.1, 10.0.125.57005), X64 RyuJIT x86-64-v3
  DefaultJob : .NET 10.0.1 (10.0.1, 10.0.125.57005), X64 RyuJIT x86-64-v3


```
| Method                        | Mean     | Error     | StdDev    | Gen0   | Gen1   | Allocated |
|------------------------------ |---------:|----------:|----------:|-------:|-------:|----------:|
| &#39;Shallow (1 level, 3 fields)&#39; | 1.873 μs | 0.0363 μs | 0.0373 μs | 1.1730 | 0.0324 |  14.38 KB |
| &#39;Deep (3 levels)&#39;             | 1.812 μs | 0.0135 μs | 0.0113 μs | 1.4381 | 0.0362 |  17.64 KB |
| &#39;Deep with maxDepth=2&#39;        | 1.348 μs | 0.0256 μs | 0.0262 μs | 1.0872 | 0.0286 |  13.34 KB |
