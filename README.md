

# 🧠 8-bit ALU – RTL to GDSII using OpenLane (Sky130)

### 👨‍💻 Author: **Nishu Tandon**

![Author](docs/author_photo.jpg)

---

## 🧩 Overview

This project implements an **8-bit Arithmetic Logic Unit (ALU)** from **RTL → GDSII** using the **OpenLane Flow** and **SkyWater 130nm PDK**.
The ALU supports basic arithmetic, logic, and comparison operations, with flags for **Zero**, **Carry**, and **Overflow**.

---

## ⚙️ Tools Used

* **Icarus Verilog** – RTL Simulation
* **GTKWave** – Waveform Viewer
* **OpenLane** – RTL to GDS Flow
* **Magic / KLayout** – Layout, DRC & LVS Check
* **Sky130 PDK** – Process Design Kit

---

## 🧠 ALU Function Table

| Operation | Opcode | Description |
| --------- | ------ | ----------- |
| ADD       | 0000   | a + b       |
| SUB       | 0001   | a - b       |
| AND       | 0010   | a & b       |
| OR        | 0011   | a | b       |
| XOR       | 0100   | a ^ b       |
| NOT       | 0101   | ~a          |
| SLL       | 0110   | a << b[2:0] |
| SRL       | 0111   | a >> b[2:0] |
| SRA       | 1000   | Signed >>   |
| EQ        | 1001   | a == b      |
| LT        | 1010   | a < b       |
| GT        | 1011   | a > b       |

---

## 🧪 Simulation Steps

### ▶️ Compile & Run

```bash
iverilog -o alu_8bit_tb alu_8bit.v alu_8bit_tb.v
vvp alu_8bit_tb
```

### 👀 View in GTKWave

```bash
gtkwave alu_8bit_tb.vcd
```

**Result:**
![GTKWave Simulation]:<img width="814" height="501" alt="image" src="https://github.com/user-attachments/assets/c79ba6a1-e620-4b46-8308-7240293973ba" />


---

## 🏗️ OpenLane Flow

### 1️⃣ Start & Mount

```bash
cd ~/OpenLane
make mount
```

### 2️⃣ Run Flow

```bash
flow.tcl -design alu_8bit
```

### 3️⃣ Reports Location

```
~/OpenLane/designs/alu_8bit/runs/<run_date>/reports/
```

| Stage     | Folder            |
| --------- | ----------------- |
| Synthesis | reports/synthesis |
| Placement | reports/placement |
| CTS       | reports/cts       |
| Routing   | reports/routing   |
| DRC       | reports/signoff   |
| LVS       | reports/signoff   |

---

## 🧾 Layout

### Open in Magic

```bash
magic -T sky130A.tech alu_8bit.mag &
```

**Layout View:**
![KLayout]:<img width="814" height="501" alt="image" src="https://github.com/user-attachments/assets/1a3a1c93-466c-490a-9679-86d6f17a9baf" />


---

## ✅ Final Results

| Step       | Status       |
| ---------- | ------------ |
| Simulation | ✅ Successful |
| Layout     | ✅ Completed  |
| DRC        | ✅ Clean      |
| LVS        | ✅ Matched    |

---

## 📂 Folder Structure

```
alu_8bit/
│
├── src/                  # Verilog files
├── simulation/           # VCD & waveforms
├── openlane/             # OpenLane configs & reports
├── layout/               # GDS screenshots            
└── LICENSE
```

