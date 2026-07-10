# Learning Log

## 2026-07-03

- Reorganized the workspace so source files and build outputs are separated.
- Confirmed the difference between source code and compiled executables.

## 2026-07-10

- Reviewed the current `cncpp` workspace structure and confirmed it is an early-stage C/C++ study repository.
- Identified that `src/day01/practice.c` contains a basic C variable/output example, while `practice.cpp` is still empty.
- Learned that compiling a C file requires a compiler such as `gcc`, `clang`, or MSVC `cl`.
- Confirmed that `gcc`, `clang`, and `cl` were not available in the current PowerShell environment.
- Learned that after installing Visual Studio, C compilation with MSVC usually needs `Developer PowerShell for Visual Studio` or `x64 Native Tools Command Prompt`.
- Learned the basic MSVC compile command: `cl src\day01\practice.c /Febuild\practice.exe`
