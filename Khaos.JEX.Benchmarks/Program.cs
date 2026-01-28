using BenchmarkDotNet.Running;
using Khaos.JEX.Benchmarks;

// Run all benchmarks
BenchmarkRunner.Run<JexBenchmarks>();
BenchmarkRunner.Run<NestedJsonBenchmarks>();
