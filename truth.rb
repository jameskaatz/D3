require 'sinatra'
require 'sinatra/reloader'
require_relative 'Table'

defaultTrue = 'T'
defaultFalse = 'F'
defaultSize = 3

def makeRows(vars, trueSymbol, falseSymbol)
    table = Table.new(vars, trueSymbol, falseSymbol)
    table.checkLogic()
    rows = table.getTable()
    size = 2 ** vars
    for x in (0..size - 1)
        rows[x] = rows[x].join('')
    end
    return rows
end

not_found do
    status 404
    erb :invalid_page
end

get '/genTable' do
    if params["True Symbol"] == nil
        trueSymbol = "T"
    else
        trueSymbol = params["True Symbol"]
    end
    #trueSymbol = params["True Symbol"] 
    falseSymbol = params["False Symbol"] 
    size = params["Size"] 


    if params["True Symbol"] == 0
        trueSymbol = "T"
    end

    if falseSymbol == nil
        falseSymbol = "F"
    end

    if size == nil
        size = 3
    else
        size = size.to_i
    end
    if size < 2 
        halt erb (:invalid_param)
    end

    if trueSymbol.length() > 1 or falseSymbol.length() > 1
        halt erb (:invalid_param)
    end

    if trueSymbol.eql? falseSymbol
        halt erb (:invalid_param)
    end

    header = ""
    x = size - 1
    while x >= 0
        header += x.to_s
        x -= 1
    end
    header += "AND\tOR\tNAND\tNOR\tSINGLETON\tXOR"

        rows = makeRows size, trueSymbol, falseSymbol
    
    numRows = 2 ** size
    erb :genTable, :locals => { size: size, rows: rows, trueSymbol: trueSymbol, falseSymbol: falseSymbol, header: header,  numRows: numRows}
end


get '/' do
    erb :index
end

