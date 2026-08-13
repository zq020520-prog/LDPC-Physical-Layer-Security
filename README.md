# LDPC-Based Physical Layer Security over QPSK Single-Path Channels

A simulation of **LDPC-based Physical Layer Security (PLS)** using QPSK modulation over a single-path wireless channel.

## Overview

This project investigates the application of **Low-Density Parity-Check (LDPC) codes** to physical layer security in a wireless communication system.

The system uses **QPSK modulation** and a **single-path fading channel** to simulate secure communication between legitimate users and an eavesdropper.

LDPC coding is used to improve the reliability of legitimate communication while the channel characteristics and decoding performance are analyzed to evaluate the security of the physical layer.

## System Model

The basic communication system is illustrated below:

```text
                     Legitimate Channel
                 ┌──────────────────────┐
                 │                      ▼
Transmitter ──► LDPC ──► QPSK ──► Channel ──► QPSK
                 │                              │
                 │                              ▼
                 │                         LDPC Decoder
                 │                              │
                 │                              ▼
                 │                        Legitimate User
                 │
                 │
                 └──────► Eavesdropper Channel
                                │
                                ▼
                          QPSK Demodulation
                                │
                                ▼
                           LDPC Decoder
                                │
                                ▼
                           Eavesdropper
```

## Communication Model

The transmitted signal is generated through the following processing chain:

```text
Information Bits
      │
      ▼
   LDPC Encoder
      │
      ▼
     QPSK
      │
      ▼
 Single-Path Channel
      │
      ▼
     AWGN
      │
      ▼
 QPSK Soft Demodulation
      │
      ▼
   LDPC Decoder
      │
      ▼
 Recovered Bits
```

The received signal can be modeled as:

```text
y = h · x + n
```

where:

* `x` — transmitted QPSK symbol
* `h` — single-path channel coefficient
* `n` — additive white Gaussian noise
* `y` — received signal

## LDPC Coding

LDPC coding is used to provide forward error correction and improve the reliability of the communication system.

The processing flow is:

```text
Information Bits
      │
      ▼
LDPC Encoder
      │
      ▼
Coded Bits
      │
      ▼
QPSK Modulation
```

At the receiver:

```text
Received QPSK Symbols
      │
      ▼
Soft Demodulation
      │
      ▼
LLR
      │
      ▼
LDPC Decoder
      │
      ▼
Decoded Information Bits
```

Soft information from the QPSK demodulator is provided to the LDPC decoder for iterative decoding.

## Physical Layer Security

The security performance is evaluated by comparing the communication performance of the legitimate receiver and the eavesdropper.

The simulation can investigate the difference between:

* Legitimate receiver
* Eavesdropper
* Different channel conditions
* Different SNR conditions

The key objective is to maintain reliable communication for the legitimate receiver while limiting the decoding performance of the eavesdropper.

## Simulation Flow

```text
Generate Information Bits
          │
          ▼
      LDPC Encoding
          │
          ▼
      QPSK Modulation
          │
          ▼
     Single-Path Channel
          │
          ▼
          AWGN
          │
          ▼
    Received Signal
          │
          ▼
   QPSK Soft Demodulation
          │
          ▼
      LDPC Decoding
          │
          ▼
   Performance Evaluation
```

## Performance Metrics

The system performance can be evaluated using:

* Bit Error Rate (BER)
* Frame Error Rate (FER)
* Block Error Rate (BLER)
* Legitimate receiver performance
* Eavesdropper performance
* Security gap

Performance can be evaluated under different SNR conditions.

## Key Technologies

* QPSK Modulation
* LDPC Coding
* Soft Demodulation
* LLR
* Single-Path Fading Channel
* AWGN Channel
* Physical Layer Security
* BER / FER Performance Analysis

## Project Structure

```text
.
├── LDPC/
│   ├── encoder
│   └── decoder
├── QPSK/
│   ├── modulation
│   └── soft_demodulation
├── Channel/
│   └── single_path_channel
├── Simulation/
│   └── main
├── Results/
└── README.md
```

## Results

The simulation results can be presented using BER/FER versus SNR curves to compare the performance of the legitimate receiver and the eavesdropper.

Example evaluation:

```text
BER
 │
 │\
 │ \
 │  \       Legitimate Receiver
 │   \
 │    \________________
 │
 │          Eavesdropper
 │           \
 │            \
 └──────────────────────── SNR
```

## Applications

The techniques investigated in this project can be applied to:

* Physical Layer Security
* Secure Wireless Communications
* LDPC-Coded Communication Systems
* Software Defined Radio (SDR)

## License

This project is for research and educational purposes.
