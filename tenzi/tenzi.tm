<TeXmacs|1.99.1>

<style|article>

<\body>
  Tenzi is a game where each player has 10 dice, the goal of which is to get
  all the dice to show one face. Players initially roll all the dice
  together, and then can pick-up any subset of the dice and re-roll. First
  person to get all dice showing the same face wins. Clearly the best
  strategy is to see what face came up the most first, and then re-roll the
  remaining until all show that one. Of course, the most prevelant face may
  change, and so one should adapt to that dynamically. Now, assuming that a
  player employed this strategy what does the distribution of turns until all
  face show the same look like?

  Let <math|t> denote the number of turns until all dice show the same face.
  We start with the simple question of "what's the probability that
  <math|t=1>?" This of course happens when we roll all of the same at once.
  Fix a face and they all show that face with probabilty <math|1/6<rsup|10>>;
  six faces imply it happens with probability <math|1/6<rsup|10-1>>. For
  convenience let <math|E<rsub|f><around*|(|n,k|)>> denote the event that a
  rolling of <math|n> results in <math|k> dice with face <math|f>. This
  <math|t=1> case can then be re-written as

  <\eqnarray*>
    <tformat|<table|<row|<cell|P<around*|(|t=1|)>>|<cell|=>|<cell|P<around*|(|<big|cup><rsub|f=1><rsup|6>E<rsub|f><around*|(|10,10|)>|)>>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|f=1><rsup|6>P<around*|(|E<rsub|f><around*|(|10,10|)>|)>>>>>
  </eqnarray*>

  And of course <math|P<around*|(|E<rsub|f><around*|(|n,k|)>|)>=Binomial<rsub|p=1/6><around*|(|n,k|)>>.

  For <math|t=2>, we must roll\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|P<around*|(|t=1|)>>|<cell|=>|<cell|P<around*|(||\<nobracket\>>>>>>
  </eqnarray*>

  \;

  I simplify the model, such that we choose the top face, and do not switch
  from there on out. If there are ties, then the match face is chosen
  randomly from those ties. For the case <math|t=2> we have

  <\eqnarray*>
    <tformat|<table|<row|<cell|P<around*|(|t=2|)>>|<cell|=>|<cell|>>>>
  </eqnarray*>
</body>

<\initial>
  <\collection>
    <associate|prog-scripts|r>
  </collection>
</initial>