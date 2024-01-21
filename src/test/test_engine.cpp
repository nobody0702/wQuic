#include "core/quic_engine.h"

int main(int argc, char** argv) {
    QuicEngine *engine = new QuicEngine();
    engine->quic_main_logic();
    return 0;
}