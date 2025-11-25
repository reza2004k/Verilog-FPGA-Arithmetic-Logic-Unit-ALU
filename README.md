# 💻 Verilog FPGA Arithmetic Logic Unit (ALU)

This project contains the Verilog HDL code for a simple **Arithmetic Logic Unit (ALU)**. The design was synthesized and tested on an **FPGA development board**, demonstrating essential principles of digital circuit design and hardware description languages.

The ALU performs common operations based on a selection code and outputs the result to a **seven-segment display** while using LEDs to indicate status flags.

## ✨ Features

* **Arithmetic Operations:** Supports **Addition**, **Subtraction**, and **Multiplication** (or division, if implemented).
* **Logic Operations:** Supports basic Boolean logic operations (e.g., **AND, OR, NOT**).
* **FPGA I/O Mapping:** Includes necessary code for mapping inputs (switches/buttons) and outputs (LEDs, 7-Segment Displays) to the specific FPGA pins.
* **Display Output:** Results are formatted for visualization on a **four-digit seven-segment display**.
* **Status Flags:** Uses individual LEDs to indicate status flags such as **Overflow, Zero, and Negative**.

## 🛠️ Technologies Used

* **Language:** Verilog HDL (Hardware Description Language)
* **Target Hardware:** FPGA Development Board (e.g., Altera/Intel or Xilinx platforms)
* **Tools:** Quartus Prime or Xilinx Vivado (for synthesis, simulation, and programming).
* **Interfaces:** LEDs, Seven-Segment Displays, Switches/Buttons.

## 🚀 Getting Started

To test and implement this project, you will need an FPGA development environment.

### Prerequisites

1.  A functioning FPGA development board (e.g., DE1-SoC, Basys 3, or similar).
2.  The corresponding FPGA development software (Quartus or Vivado).

### Setup and Implementation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/YOUR_USERNAME/Verilog-FPGA-Arithmetic-Logic-Unit-ALU.git](https://github.com/YOUR_USERNAME/Verilog-FPGA-Arithmetic-Logic-Unit-ALU.git)
    cd Verilog-FPGA-Arithmetic-Logic-Unit-ALU
    ```
2.  **Project Setup:**
    * Create a new project in your FPGA IDE (Quartus/Vivado).
    * Add the Verilog source files (e.g., `alu.v`, `seven_segment_decoder.v`) to your project.
3.  **Pin Assignment:**
    * **Crucial Step:** You must modify the top-level module or constraints file (`.qsf` or `.xdc`) to match the **pin assignments** for the LEDs, 7-segment display segments, and input switches on *your specific FPGA board*.
4.  **Synthesize and Program:**
    * Compile (Synthesize) the design.
    * Generate the programming file (e.g., `.sof` or `.bit`).
    * Program the FPGA board.

### Usage

Once the FPGA is programmed, you can test the ALU:

1.  Use the **input switches** on the board to set the input operands (A and B).
2.  Use a set of switches or buttons to set the **4-bit Operation Select Code**.
3.  Observe the result on the **seven-segment display** and the status indicators on the **LEDs**.

| Select Code | Operation |
| :---: | :--- |
| `0000` | Addition (A + B) |
| `0001` | Subtraction (A - B) |
| `0010` | Logical AND (A & B) |
| `0011` | Logical OR (A \| B) |
| *... (Add your specific operation codes here)* | |

---

Would you like to generate a simple example of the Verilog code structure for the ALU?
