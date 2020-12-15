use_bpm 94

# Defining instrument voicings here so I don't have to specify characteristics for each note in the live_loops below.

def sub_bass(note:, sleep:, amp: 1, sustain: 16, pan: 0, release: 0, attack: 0)
  use_synth :beep
  play note, amp: amp, sustain: sustain, pan: pan, release: release, attack: attack
  sleep sleep
end

def bass(note:, sleep:, amp: 0.5, sustain: 16, pan: 0, release: 0, attack: 0)
  use_synth :chipbass
  play note, amp: amp, sustain: sleep, pan: pan, release: release, attack: attack, attack_level: 0.3, decay_level: 0.5
  sleep sleep
end

def melody(note:, sleep:, amp: 0.8, sustain: 16, pan: 0, release: 0, attack: 0)
  with_fx :ping_pong, phase: 0.75 do
    use_synth :sine
    play note, amp: amp, sustain: 0.25, pan: pan, release: release, attack: attack, decay_level: 0.5
    sleep sleep
  end
end

# Sub Bass anchoring the piece with F and G!
live_loop :sub_loop do
  sub_bass(note: :F2, sleep: 16)
  sub_bass(note: :G2, sleep: 16)
end

live_loop :bass_loop do
  2.times do
    bass(note: :F2, sleep: 1)
    bass(note: :E3, sleep: 1)
    bass(note: :C3, sleep: 1)
    bass(note: :E3, sleep: 2)
    bass(note: :E3, sleep: 1)
    bass(note: :C3, sleep: 1)
    bass(note: :E3, sleep: 1)
  end
  2.times do
    bass(note: :E2, sleep: 1)
    bass(note: :D3, sleep: 1)
    bass(note: :B2, sleep: 1)
    bass(note: :D3, sleep: 2)
    bass(note: :D3, sleep: 1)
    bass(note: :B2, sleep: 1)
    bass(note: :D3, sleep: 1)
  end
end

live_loop :melody_loop do
  (1..2).each_with_index do |c, i|   # F
    if i == 0
      melody(note: :E5, sleep: 0.5)  # if we're on our second iteration, the first note should be a rest instead.
    else
      sleep 0.5
    end

    melody(note: :E5, sleep: 0.5)
    melody(note: :A4, sleep: 0.5)
    melody(note: :A4, sleep: 0.5)
    melody(note: :G5, sleep: 0.5)
    melody(note: :G5, sleep: 0.5)
    melody(note: :E5, sleep: 0.5)
    melody(note: :E5, sleep: 1)
    melody(note: :E5, sleep: 0.5)
    melody(note: :A4, sleep: 0.5)
    melody(note: :A4, sleep: 0.5)
    melody(note: :G5, sleep: 0.5)
    melody(note: :G5, sleep: 0.5)
    melody(note: :E5, sleep: 0.5)
    melody(note: :E5, sleep: 0.5)
  end

  (1..2).each_with_index do |c, i|  # G
    if i == 0
      melody(note: :D5, sleep: 0.5) # second iteration condition from above applies here too.
    else
      sleep 0.5
    end
    melody(note: :D5, sleep: 0.5)
    melody(note: :G4, sleep: 0.5)
    melody(note: :G4, sleep: 0.5)
    melody(note: :D4, sleep: 0.5)
    melody(note: :D4, sleep: 0.5)
    melody(note: :D5, sleep: 0.5)
    melody(note: :D5, sleep: 1)
    melody(note: :D5, sleep: 0.5)
    melody(note: :G4, sleep: 0.5)
    melody(note: :G4, sleep: 0.5)
    melody(note: :D4, sleep: 0.5)
    melody(note: :D4, sleep: 0.5)
    melody(note: :D5, sleep: 0.5)
    melody(note: :D5, sleep: 0.5)
  end
end