function [accuracy] = NBclassifier(n,m,d,train,test,v)

class= unique(train(:,d));

%atributes and their lengths

atribute1= unique(train(:,1));
length_of_atribute1 = length(atribute1);

atribute2= unique(train(:,2));
length_of_atribute2 = length(atribute2);

atribute3= unique(train(:,3));
length_of_atribute3 = length(atribute3);

atribute4= unique(train(:,4));
length_of_atribute4 = length(atribute4);


%length of class

length_of_class = length(class);

%Calculate prior probability

for c=1:length_of_class
     prior_probability(c)=sum(double(train(:,d)==class(c)))/length(train);
end

outputArg1 = prior_probability;

%Training section 
a = 1;
values=v ;
for c=1:length_of_class
    for x=1:d-1
        if x == 1
            for v =atribute1(1,:): atribute1(end,:)
                denominator = (sum(double(train(:,d)==c))+a*length_of_atribute1);
                P_of_atribute1(c,v)=(sum(double(train(:,x)== v & train(:,d)==c))+a)/denominator;
            end
        elseif x == 2
            for v =atribute2(1,:): atribute2(end,:)
                denominator = (sum(double(train(:,d)==c))+a*length_of_atribute2);
                P_of_atribute2(c,v)=(sum(double(train(:,x)== v & train(:,d)==c))+a)/denominator;
            end
        elseif x == 3
            for v =atribute3(1,:): atribute3(end,:)
               denominator = (sum(double(train(:,d)==c))+a*length_of_atribute3);
                P_of_atribute3(c,v)=(sum(double(train(:,x)== v & train(:,d)==c))+a)/denominator;
            end
        elseif x == 4
            for v =atribute4(1,:): atribute4(end,:)
               denominator = (sum(double(train(:,d)==c))+a*length_of_atribute4);
                P_of_atribute4(c,v)=(sum(double(train(:,x)== v & train(:,d)==c))+a)/denominator;
            end
        end
    end

end

%Testing section
dim = 2;
for c=1:length_of_class

    for i = 1:n
        for x=1:d-1
            if x == 1
                if values(1,x)>= numel(unique(test(:,x)))
                    for v =atribute1(1,:): atribute1(end,:)
                        if test(i,x)== v
                            prob(i,v) = P_of_atribute1(c,v);
                            m(i,1)=prob(i,v);
                        end
                    end
                end
            elseif x == 2
                if values(1,x)>= numel(unique(test(:,x)))
                    for v =atribute2(1,:): atribute2(end,:)
                        if test(i,x)== v
                            prob(i,v) = P_of_atribute2(c,v);
                            m(i,2)=prob(i,v);
                        end
                    end
                end
            elseif x == 3
                if values(1,x)>= numel(unique(test(:,x)))
                    for v =atribute3(1,:): atribute3(end,:)
                        if test(i,x)== v
                            prob(i,v) = P_of_atribute3(c,v);
                            m(i,3)=prob(i,v);
                        end
                    end
                end
            elseif x == 4
                if values(1,x)>= numel(unique(test(:,x)))
                    for v =atribute4(1,:): atribute4(end,:)
                        if test(i,x)== v
                            prob(i,v) = P_of_atribute4(c,v);
                            m(i,4)=prob(i,v);
                        end
                    end
                end
            end
        end
        end
        if c==1
            P_of_yes = prod(m,dim)*prior_probability(c);
        elseif c==2
            P_of_no = prod(m,dim)*prior_probability(c);
        end
end
z = 0;
for k=1: n
    if P_of_yes(k) > P_of_no(k)
        z = z+1;
        fprintf('test case n.o  : %2d : can play \n',k);
    else 
        fprintf('test case n.o  : %2d : cannot play \n',k);
    end
end
%checking accuracy of test
accuracy = (z/n)*100;
end

