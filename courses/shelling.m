%% Schelling's segregation mode
F=0.3;  %"happy" fraction of friends

%world is a 2D grid filled with two types of residents, "1" and "2"
world = randi(2,100,100);

% plus some empty spots (zero)
world(rand(100,100)<0.3)=0;

figure(1),imagesc(world),title('initial')


for t=1:20
%% Relocate "1' residents
%calculate neighbors for +1
sameNeighb = imfilter(double(world==1),ones(3,3));
totalNeighb = imfilter(ones(100,100),ones(3,3));
selfIdxs=find(world==1);
neighbFrac = (sameNeighb(selfIdxs)-1)./(totalNeighb(selfIdxs)-1);

%unhappy residents that will move
moveIdxs = selfIdxs(neighbFrac<F);
nMove=length(moveIdxs);

%move unhappy residents to empty cells
emptyCells = find(world==0);
nEmpty=length(emptyCells);

%move unhappy residents to empty cells **in random order**
randOrder = randperm(nEmpty);
emptyCells = emptyCells(randOrder);

%move here
world(moveIdxs) = 0;
world(emptyCells(1:nMove)) = 1;

%% Relocate "2" residents
%calculate neighbors for 2
sameNeighb = imfilter(double(world==2),ones(3,3));
totalNeighb = imfilter(ones(100,100),ones(3,3));
selfIdxs=find(world==2);
neighbFrac = (sameNeighb(selfIdxs)-1)./(totalNeighb(selfIdxs)-1);

%unhappy residents that will move
moveIdxs = selfIdxs(neighbFrac<F);
nMove=length(moveIdxs);

%move unhappy residents to empty cells
emptyCells = find(world==0);
nEmpty=length(emptyCells);

%move unhappy residents to empty cells **in random order**
randOrder = randperm(nEmpty);
emptyCells = emptyCells(randOrder);

%move here
world(moveIdxs) = 0;
world(emptyCells(1:nMove)) = 2;

figure(2),imagesc(world),title(t)
end



