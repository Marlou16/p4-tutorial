/* -*- P4_16 -*- */
#include <core.p4>
#include <v1model.p4>

struct metadata {}
struct headers {}

parser MyParser(packet_in packet, out headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    // your parser always starts in the 'state' state and ends in the 'accept' state
    // As you can see, we did not add any additional states and rules
    state start { transition accept; }
}

// In this step you can implement how there is 'checked' wheter the arrived packet is correct (i.e. not corrupted)
control MyVerifyChecksum(inout headers hdr, inout metadata meta) {
    apply {
        // nothing;
    }
}

// Only here did we implement some additional functionality.
// Given the "in_port" of a packages, we set the "out_port"
// So, a package coming in at port 1, we will forward to port 2 (and vice versa)
control MyIngress(inout headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    apply {
        if (standard_metadata.ingress_port == 1) {
            standard_metadata.egress_spec = 2;
        }
        else if (standard_metadata.ingress_port == 2) {
            standard_metadata.egress_spec = 1;
        }
    }
}

control MyEgress(inout headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    apply {
        // nothing;
    }
}

// In this step you can implement how to set the checksum that is used to calculate the correctness of a packet
control MyComputeChecksum(inout headers hdr, inout metadata meta) {
    apply {
        // nothing
    }
}

// Here you can specify in which order certain headers of your packet
// Because we don't specify any headers or something like that, we can skip this.
control MyDeparser(packet_out packet, in headers hdr) {
    apply {
        // nothing
    }
}

// Defenition of the switch and the steps it takes
V1Switch(
    MyParser(),
    MyVerifyChecksum(),
    MyIngress(),
    MyEgress(),
    MyComputeChecksum(),
    MyDeparser()
) main;
