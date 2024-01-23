#pragma once

class IQuicEngine {
public:
    virtual int quic_main_logic() = 0;
    virtual ~IQuicEngine() = default;
};