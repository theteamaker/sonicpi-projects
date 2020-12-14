use_bpm 110

live_loop :dialrhythm_lead do
  lead = get[:lead]
  lead.each_with_index do |note, c|
    sustain = 1
    
    if c == 3
      sustain = 5.5
    end
    
    use_synth :sine
    play note[0], release: sustain, decay_level: 0, amp: 0.3
    sleep note[1]
  end
end

live_loop :da_chords do
  sync :dialrhythm_lead
  chords = get[:chords]
  chords.each do |chord|
    4.times do
      use_synth :pluck
      play_pattern_timed chord[0], 0.25, sustain: 0.5, release: 0, amp: 1
    end
    #sleep chord[1]
  end
end

live_loop :subby do
  sync :dialrhythm_lead
  bass = get[:sub_bass]
  
  bass.each_with_index do |note, c|
    use_synth :beep
    play note[0], sustain: note[1], release: 0, env_curve: 1, amp: 0.4
    sleep note[1]
  end
end

live_loop :harmony do
  sync :dialrhythm_lead
  harmony = get[:harmony_notes]
  sleep 12
  harmony.each_with_index do |note, c|
    use_synth :sine
    play note[0], sustain: note[1], amp: rand(0.3..0.4), release: 0
    sleep note[1]
  end
end

live_loop :saw do
  sync :dialrhythm_lead
  melody = get[:melody_notes]
  melody.each_with_index do |note, c|
    
    if c.remainder(2.0) == 0
      pan = rand(-0.4..-0.3)    # panning events
    else
      pan = rand(0.3..0.4)
    end
    
    use_synth :sine
    play note[0], pan: pan, sustain: note[1], release: 0.1, amp: rand(0.3..0.5)
    sleep note[1]
  end
end