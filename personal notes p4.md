--> The presentation of Wouter (over SLACK, in my downloads) isn't the same as here in p4lang/tutorials
--> Is there a GO course?!?!

*P4 Tutorial for Dummy's*
>> Can I make the 'hello_world' work (see slides P4lang/tutorial)
>> I think maybe not let the reader do some programming, but let them see / understand the hello_world and basic.p4
>> Let them see 'the future of networking'
>> Where is the (static) control plane implemented that the basic.p4 uses??  run_exercise.py
>> Make a drawing of what feeds what (context)
>> You also need to explain the networking layers (ETH)(IP)(PAYLOAD) + Switching for dummy's
>> Nog eens nakijken wat Michel allemaal had geblogd :)

P4 is not restricted to Tofino, but Tofino is nowadays the only fully programmable asic supporting line rates
For using Tofino you needs a NDA (which KPN has)
P4 is not restricted to Tofino, but is a domain specific language. (+ behavioral modeling/descripting language)

difference between P4_14 and P4_16 is that P4_14 did some assumptions of the abilities of the hardware it is used on.

If you want to change where you 'run' the code on,
it should be that you only need to change one #include line and give it to the right compiler  (<--!!!)
ALL THE MAGIC HAPPENS IN THE COMPILER!  <-- learn about compilers!

Example architectures: V1Model, SimpleSumeSwitch, Prtable Switch Architecture (PSA)
The V1 model is programmed on top of the BMv switch_switch target
Statement: The "Traffic Manager" is not yet programmable.
Google uses P4 to model the fixed function switches (such as Trident and Tomahawk)

egress_spec = the port to which the packet should be sent to
egress_port = the port that the packet will be sent out of (read only in egress pipeline)

--> different models will give you different (standard_)metadata (or you can define it yourself)
    But you are always allowed to add your own metadata :)

To be protocol independent, the ethernet and ipv4 headers are solely used as examples.

@table -> size is the number of entries.

----------------------- intermezzo -------------------------
Noa Zilberman and Robert Soulé from the 'organisation' / 'association' --> Cambridge P4 day, but more academic
Another P4 dev day, in combination with Stordis ...
LLVM?
------------------------------------------------------------

Get together met Telofonika via Stordis?!
Quién es Andrea from ONF?
Toch ook Deutsche Telekom  (maar dan andere mensen als Nico/Mohamed/Edo/Eduard)

Stordis is awesome... lookinto B.

- siticom
- sidn (NL)


-----------------------------
p4.org/events
https://www.cl.cam.ac.uk/~nz247/publications.html

Wil ik toch op twitter (#switch2open, aaglenn, ethanbanks)
P4_16 specs
P4_runtime specs
