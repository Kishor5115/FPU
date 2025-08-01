#  Pipelined Floating Point Unit (FPU)


**Description:**  
This project implements a **32-bit IEEE 754 compliant Floating Point Unit (FPU)** supporting **Addition, Subtraction, Multiplication, and Division**. It uses a custom **multi-stage pipeline**, Carry Lookahead Adders, a Barrel Shifter, a 5-stage Wallace Tree Multiplier, and a synchronous Divider. Designed for high-throughput operations in digital datapaths.

---

## 📌 Key Features

- ✅ **IEEE 754 single-precision** 32-bit floating point
- ✅ Operations: `ADD`, `SUB`, `MUL`, `DIV`
- ✅ **4-stage pipelined architecture**
- ✅ Handles special cases: `INF`, `ZERO`, divide-by-zero
- ✅ Custom modules for:
  - Exponent CLA arithmetic
  - Mantissa alignment (Barrel Shifter)
  - Multi-layer Wallace Tree Multiplication
  - Synchronous Division with REQ/READY handshake
  - Two’s complement conversion
  - Normalization (Leading Zero Detection)

---

## ⚙️ Pipeline Stages

| Stage | Function |
|-------|-----------|
| **Stage 1️⃣** | Exponent arithmetic with CLA; bias adjustment |
| **Stage 2️⃣** | Mantissa alignment using Barrel Shifter |
| **Stage 3️⃣** | Core mantissa operation (Add/Sub/Mul/Div) |
| **Stage 4️⃣** | Normalization, exponent correction, sign resolution, final IEEE 754 packing |

---

## 🔍 Core Modules

- `cla.v` – Generic Carry Lookahead Adder  
- `cla_add.v` – 24-bit Mantissa CLA  
- `twoscomp.v` – Two’s complement converter for sign handling  
- `shifter.v` – Barrel Shifter for mantissa alignment  
- `normal.v` – Normalizer with leading-zero detection  
- `mul_l1` → `mul_l5.v` – Wallace Tree multiplier layers  
- `divider.v` – Synchronous divider with `REQ`/`READY` handshake

---

## 🧩 Special Case Handling

- Proper propagation of `INF` when exponent = `8'b11111111`
- Handles zero operands (returns other operand)
- Divide-by-zero generates `INF`
- Sign resolution for all operations (bitwise XOR for MUL/DIV)
- Short-circuit special results using `SPBIT` stages

---

## 📈 Design Highlights

- Multi-stage pipelined datapath for high throughput
- Full custom datapath – no vendor IP cores
- Robust control logic with `CTRL0`, `CTRL1`, `CTRL2`
- Special path for special results (`SP0` → `SP2`)
- All operations validated for edge conditions

---

## ✅ Skills Demonstrated

- Digital Design: CLA, Barrel Shifter, Wallace Tree Multiplier
- Pipelined Datapath Architecture
- IEEE 754 Floating Point Logic
- Verilog HDL modular design
- Corner case detection & pipeline stall management





