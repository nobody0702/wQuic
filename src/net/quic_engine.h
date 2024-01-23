#pragma once
#include "interface/quic_engine_i.h"
#include "quic_conn.h"
#include "quic_cid.h"
#include <map>
#include <memory>

class QuicEngine : public IQuicEngine  {
public:
    QuicEngine();
    ~QuicEngine();
    int quic_main_logic() override;
private:
    std::map<cid_seqnum_t, std::unique_ptr<QuicConn> > conn_set;
};