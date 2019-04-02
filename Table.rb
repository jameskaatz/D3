class Table

    attr_accessor :trueSymbol
    attr_accessor :falseSymbol
    attr_accessor :truthTable
    attr_accessor :variables
    attr_accessor :size
        def initialize (vars, trueSymbol, falseSymbol)
            @size = 2 ** vars
            @True = trueSymbol
            @False = falseSymbol
            @truthTable = Array.new(2 ** vars, Array.new(vars + 4, falseSymbol))
            @variables = vars   
        end 

        def thing
            x = 0
            while x < @size
                puts "#{@truthTable[x].join}"
                x += 1
            end
        end
        

        def createTable
            lookup_table = Hash.new { |h, i| h[i] = i.to_s(2) }
            x = 0
            vars = @variables

            i = 0
            x = 0
            while x < @size
                @truthTable[x] = lookup_table[x].split('')
                n = 0
                while n < @variables
                    if  @truthTable[x][n] == '1'
                        @truthTable[x][n] = @True
                    end
                    if @truthTable [x][n] == '0'
                        @truthTable [x][n] = @False
                    end
                    n += 1
                end
                i += 1
                x += 1
            end
            x = 0
            while x < @size
                while @truthTable[x].length < @variables
                    @truthTable[x].unshift(@False)
                end
                x += 1
            end
            x = 0
        end

        def checkAnd
            x = 0
            while x < @size
                i = 0
                size = 0
                while i < @variables
                    if(@truthTable[x][i] == @True)
                        size += 1
                    end
                    i += 1
                end
                if size == @variables
                    @truthTable[x].push(@True)
                else
                    @truthTable[x].push(@False)
                end
                size = 0
                x += 1
            end
        end
        def checkOr
            x = 0
            while x < @size
                i = 0
                size = 0
                while i < @variables
                    if(@truthTable[x][i] == @True)
                        size += 1
                    end
                    i += 1
                end
                if size >= 1
                    @truthTable[x].push(@True)
                else
                    @truthTable[x].push(@False)
                end
                size = 0
                x += 1
            end
        end

        def checkNand
            x = 0
            while x < @size
                i = 0
                size = 0
                while i < @variables
                    if(@truthTable[x][i] == @True)
                        size += 1
                    end
                    i += 1
                end
                if size != @variables
                    @truthTable[x].push(@True)
                else
                    @truthTable[x].push(@False)
                end
                size = 0
                x += 1
            end
        end

        def checkNor
            x = 0
            while x < @size
                i = 0
                size = 0
                while i < @variables
                    if(@truthTable[x][i] == @True)
                        size += 1
                    end
                    i += 1
                end
                if size < 1
                    @truthTable[x].push(@True)
                else
                    @truthTable[x].push(@False)
                end
                size = 0
                x += 1
            end
        end

        def checkXor
            x = 0
            while x < @size
                i = 0
                size = 0
                while i < @variables
                    if(@truthTable[x][i] == @True)
                        size += 1
                    end
                    i += 1
                end
                if size % 2 == 0 or size == 0
                    @truthTable[x].push(@False)
                else
                    @truthTable[x].push(@True)
                end
                size = 0
                x += 1
            end
        end

        def checkSingleton
            x = 0
            while x < @size
                i = 0
                size = 0
                while i < @variables
                    if(@truthTable[x][i] == @True)
                        size += 1
                    end
                    i += 1
                end
                if size == 1
                    @truthTable[x].push(@True)
                else
                    @truthTable[x].push(@False)
                end
                size = 0
                x += 1
            end
        end

        def checkLogic
            createTable()
            checkAnd()
            checkOr()
            checkNand()
            checkNor()
            checkXor()
            checkSingleton()
        end

        def getTable
            return @truthTable
        end
                
                


end

            

                