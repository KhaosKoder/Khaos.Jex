```

BenchmarkDotNet v0.15.8, Windows 11 (10.0.26200.7628/25H2/2025Update/HudsonValley2)
13th Gen Intel Core i7-13650HX 2.60GHz, 1 CPU, 20 logical and 14 physical cores
.NET SDK 10.0.101
  [Host]     : .NET 10.0.1 (10.0.1, 10.0.125.57005), X64 RyuJIT x86-64-v3
  DefaultJob : .NET 10.0.1 (10.0.1, 10.0.125.57005), X64 RyuJIT x86-64-v3


```
| Method                               | Mean       | Error    | StdDev    | Gen0   | Gen1   | Allocated |
|------------------------------------- |-----------:|---------:|----------:|-------:|-------:|----------:|
| &#39;Simple: Copy 2 fields&#39;              |   348.2 ns |  6.22 ns |   5.82 ns | 0.1197 |      - |   1.47 KB |
| &#39;Complex: Transform with conditions&#39; | 1,540.1 ns | 24.16 ns |  22.60 ns | 0.3929 | 0.0038 |   4.83 KB |
| &#39;Loop: Process 5 items&#39;              | 3,005.8 ns | 15.09 ns |  13.37 ns | 0.7477 | 0.0076 |    9.2 KB |
| &#39;Functions: String &amp; math ops&#39;       | 4,733.1 ns | 93.89 ns | 118.74 ns | 1.3962 | 0.0381 |  17.13 KB |
| &#39;ExpandJson: Single field&#39;           | 1,601.9 ns | 11.01 ns |  10.30 ns | 0.6466 | 0.0114 |   7.95 KB |
| &#39;ExpandJsonAll: Entire document&#39;     | 3,527.3 ns | 62.96 ns |  52.58 ns | 1.7929 | 0.0572 |     22 KB |
| &#39;Compile: Simple script&#39;             |   812.2 ns |  8.81 ns |   8.24 ns | 0.1030 |      - |   1.27 KB |
| &#39;Compile: Complex script&#39;            | 5,962.3 ns | 30.78 ns |  27.29 ns | 0.5188 |      - |   6.38 KB |
