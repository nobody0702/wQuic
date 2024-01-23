#include "net/quic_engine.h"
#include "interface/quic_engine_i.h"

int main(int argc, char** argv) {
    IQuicEngine *engine = new QuicEngine();
    engine->quic_main_logic();
    return 0;
}